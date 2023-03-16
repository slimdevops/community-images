const fs = require("fs");
const path = require("path");

//GLOBAL VARIABLES
const REGISTRY = process.env['REGISTRY'];
const NAMESPACE = process.env['NAMESPACE'];

const REPOSITORY = process.env['REPOSITORY'];
const PROJECT_TARGET_REPOSITORY = process.env['PROJECT_TARGET_REPOSITORY'];
const PROJECT_SOURCE = process.env['PROJECT_SOURCE'];

let TARGET_REPO = REPOSITORY;
if (PROJECT_SOURCE == "dockerfile") {
    TARGET_REPO = PROJECT_TARGET_REPOSITORY;
}

const SLIM_IMAGE_NS = process.env['SLIM_IMAGE_NS'];
const PROJECT_IMAGE_TAG_SLIM = process.env['PROJECT_IMAGE_TAG_SLIM'];
const TAG = process.env['TAG'];

const GITHUB_WORKSPACE = process.env['GITHUB_WORKSPACE'];
const PROJECT_ORIGINAL_IMAGE = process.env['PROJECT_ORIGINAL_IMAGE'];
const ACTION_RUNNER_URL = process.env['ACTION_RUNNER_URL'];
const PROJECT_FULL_PATH = process.env["PROJECT_FULL_PATH"];
const REPOSITORY_FULL_PATH = process.env["REPOSITORY_FULL_PATH"];
const PROJECT_PATH = process.env["PROJECT_PATH"];
const PROJECT_MANIFEST_PATH = path.join(PROJECT_FULL_PATH, "project.json");
const PROJECT_STATUS_FAILED = (process.argv[2] != 'success');



updateMainReadme();
updateProjectReadme();

/* Functions */

function updateProjectReadme() {
    const REPORT_PATH = path.join(PROJECT_FULL_PATH, `vscan-xray-reports`);
    const fatXrayPath = path.join(REPORT_PATH, `xray-${TARGET_REPO}-${TAG}-report.json`);
    const slimXrayPath = path.join(REPORT_PATH, `xray-${TARGET_REPO}-${PROJECT_IMAGE_TAG_SLIM}-report.json`);
    const fatVulPath = path.join(REPORT_PATH, `vscan-${TARGET_REPO}-${TAG}-report.json`);
    const slimVulPath = path.join(REPORT_PATH, `vscan-${TARGET_REPO}-${PROJECT_IMAGE_TAG_SLIM}-report.json`);

    const projectReadMePath = path.join(PROJECT_FULL_PATH, "README.md");
    const repoProjectTemplatePath = path.join(GITHUB_WORKSPACE, "/bin/templates/", "project.readme.template");

    if (fs.existsSync(projectReadMePath)) fs.unlinkSync(projectReadMePath);

    let template = fs.readFileSync(repoProjectTemplatePath, 'utf8') + "";

    const status = PROJECT_STATUS_FAILED ? "![status-badge](https://img.shields.io/badge/Build-Failing-red.svg)" : "![status-badge](https://img.shields.io/badge/Build-Passing-green.svg)";
    const vulDiff = vulnerabilityDiff(fatVulPath, slimVulPath);
    const xrDiff = xrayDiff(fatXrayPath, slimXrayPath);
    const templateVars = { ...vulDiff, ...xrDiff };
    for (const key of Object.keys(templateVars)) {
        template = template.replace(new RegExp(`<${key}>`, "g"), `${templateVars[key]}`);
    }
    template = template.replace(/<repo\/image_name>/g, `${NAMESPACE}/${REPOSITORY}`);
    template = template.replace(/<workflow_status>/g, status);
    if (!PROJECT_STATUS_FAILED) template = template.replace(/<slim_link>/g, `https://portal.slim.dev/home/xray/dockerhub:%2F%2Fdockerhub.public%2F${SLIM_IMAGE_NS}%2F${REPOSITORY}:${PROJECT_IMAGE_TAG_SLIM}#explorer`);
    else template = template.replace(/<slim_link>/g, `https://portal.slim.dev/`);

    fs.writeFileSync(projectReadMePath, template);
}


function updateMainReadme() {
    const indexReadMePath = path.join(REPOSITORY_FULL_PATH, "README.md");
    const uniqueId = `${REGISTRY}-${NAMESPACE}-${REPOSITORY}-${TAG}`.toLowerCase();
    const TR_TEMPLATE = ` <tr id="${uniqueId}">
    <td class="project-name">Place Holder</td>
    <td class="project-status">Place Holder</td>
    <td class="project-image">Place Holder</td>
    <td class="project-last-update">Place Holder</td>
    </tr>
</table>`;

    try {
        const projectManifest = JSON.parse(fs.readFileSync(PROJECT_MANIFEST_PATH, 'utf8'));
        const projectName = projectManifest.name;
        const isHelloWorld = projectManifest?.category == "hello-world";

        const data = fs.readFileSync(indexReadMePath, 'utf8');
        const startComment = isHelloWorld ? '<!-- image-runner-status-table-hello-world-del -->' : '<!-- image-runner-status-table-base-image-del -->';
        const endComment = isHelloWorld ? '<!-- image-runner-status-table-hello-world-edel -->' : '<!-- image-runner-status-table-base-image-edel -->';
        const startIndex = data.indexOf(startComment) + startComment.length;
        const endIndex = data.indexOf(endComment, startIndex);
        const tableData = data.substring(startIndex, endIndex);
        const tr = extractTrById(tableData, uniqueId);
        const statusImage = '<a href="' + ACTION_RUNNER_URL + '">' + (PROJECT_STATUS_FAILED ? '<img src="https://img.shields.io/badge/Build-Failing-red.svg" />' : '<img src="https://img.shields.io/badge/Build-Passing-green.svg" />') + '</a>';
        const projectNameLnk = `<a href="${PROJECT_PATH}">${projectName}</a>`;

        let newData = "";
        let newTableData = "";

        if (tr) {
            const newTr = updateTrProjectEntry(tr, projectNameLnk, PROJECT_ORIGINAL_IMAGE, statusImage);
            newTableData = tableData.replace(tr, newTr);
        }
        else {
            const newTr = updateTrProjectEntry(TR_TEMPLATE, projectNameLnk, PROJECT_ORIGINAL_IMAGE, statusImage);
            newTableData = tableData.replace("</table>", newTr);
        }

        newData = data.replace(tableData, newTableData);
        fs.writeFileSync(indexReadMePath, newData, 'utf8');
        console.log("Updated Index Readme");

    } catch (e) {
        console.log('Error:', e.stack);
        process.exit(1);
    }
}

function xrayDiff(fatXrayPath, slimXrayPath) {
    let original_size_in_mb = "Unknown";
    let slim_size_in_mb = "Unknown";
    let pct_diff_size = "Unknown";
    let original_file_count = "Unknown";
    let slim_file_count = "Unknown";
    let pct_diff_file_count = "Unknown";

    if (fs.existsSync(fatXrayPath) && fs.existsSync(slimXrayPath)) {
        const fatXrayReport = JSON.parse(fs.readFileSync(fatXrayPath, 'utf8'));
        const slimXrayReport = JSON.parse(fs.readFileSync(slimXrayPath, 'utf8'));

        original_size_in_mb = fatXrayReport.source_image.size_human;
        slim_size_in_mb = slimXrayReport.source_image.size_human;
        pct_diff_size = (parseFloat(100 * ((fatXrayReport.source_image.size - slimXrayReport.source_image.size) / fatXrayReport.source_image.size)) | 0.00).toFixed(2);
        original_file_count = fatXrayReport.image_layers.reduce((prev, item) => { return (prev + item.stats?.file_count) }, 0);
        slim_file_count = slimXrayReport.image_layers.reduce((prev, item) => { return (prev + item.stats?.file_count) }, 0);
        pct_diff_file_count = (parseFloat(100 * ((original_file_count - slim_file_count) / original_file_count)) | 0.00).toFixed(2);
    }

    return {
        original_size_in_mb,
        slim_size_in_mb,
        pct_diff_size,
        original_file_count,
        slim_file_count,
        pct_diff_file_count
    }
}

function vulnerabilityDiff(fatVulPath, slimVulPath) {

    let original_vuln_count = "Unknown";
    let slim_vuln_count = "Unknown";
    let pct_diff_vuln_count = "Unknown";
    let vuln_count_diff = "Unknown";
    let original_critical_vuln_count = "Unknown";
    let slim_critical_vuln_count = "Unknown";
    let original_high_vuln_count = "Unknown";
    let slim_high_vuln_count = "Unknown";

    if (fs.existsSync(fatVulPath) && fs.existsSync(slimVulPath)) {
        const fatVulReport = JSON.parse(fs.readFileSync(fatVulPath, 'utf8'));
        const slimVulReport = JSON.parse(fs.readFileSync(slimVulPath, 'utf8'));

        original_vuln_count = fatVulReport?.summary?.unique_vulnerability?.count;
        slim_vuln_count = slimVulReport?.summary?.unique_vulnerability?.count;
        pct_diff_vuln_count = (parseFloat(100 * ((original_vuln_count - slim_vuln_count) / original_vuln_count)) | 0.00).toFixed(2);
        vuln_count_diff = (original_vuln_count - slim_vuln_count);
        original_critical_vuln_count = fatVulReport?.summary?.unique_vulnerability?.severity_counts?.CRITICAL;
        slim_critical_vuln_count = slimVulReport?.summary?.unique_vulnerability?.severity_counts?.CRITICAL;
        original_high_vuln_count = fatVulReport?.summary?.unique_vulnerability?.severity_counts?.HIGH;
        slim_high_vuln_count = slimVulReport?.summary?.unique_vulnerability?.severity_counts?.HIGH;
    }

    return {
        original_vuln_count,
        slim_vuln_count,
        pct_diff_vuln_count,
        vuln_count_diff,
        original_critical_vuln_count,
        slim_critical_vuln_count,
        original_high_vuln_count,
        slim_high_vuln_count,
    }
}

function extractTrById(tableHtml, id) {
    const trRegex = new RegExp('<tr[^>]+id="' + id + '"[^>]*>([\\s\\S]*?)<\/tr>');
    const trMatch = tableHtml.match(trRegex);

    if (trMatch) {
        const trHtml = trMatch[1];
        return trHtml;
    }
    return null;
}

function updateTrProjectEntry(trHtml, projectName, projectImage, statusImage) {
    let newTrHtml = trHtml;
    newTrHtml = newTrHtml.replace(/<td[^>]+class="project-name"[^>]*>([\s\S]*?)<\/td>/, `<td class="project-name">${projectName}</td>`);
    newTrHtml = newTrHtml.replace(/<td[^>]+class="project-status"[^>]*>([\s\S]*?)<\/td>/, `<td class="project-status">${statusImage}</td>`);
    newTrHtml = newTrHtml.replace(/<td[^>]+class="project-image"[^>]*>([\s\S]*?)<\/td>/, `<td class="project-image">${projectImage}</td>`);
    newTrHtml = newTrHtml.replace(/<td[^>]+class="project-last-update"[^>]*>([\s\S]*?)<\/td>/, `<td class="project-last-update">${new Date().toISOString()}</td>`);
    return newTrHtml;
}


