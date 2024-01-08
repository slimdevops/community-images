import xml.etree.ElementTree as ET
import re
from sys import argv
from xml.sax.saxutils import escape


def generate_junit_xml(test_output):
    # Regular expression to match a single test result
    test_regex = r"\[(?P<status>.*)\]: (?P<name>.*)( \((?P<time>\d+) ms\))?"

    # Initialize empty list to store test results
    test_results = []

    # Iterate over each line in the test output
    for line in test_output.split("\n"):
        # Try to match the line to the regular expression
        match = re.search(test_regex, line)

        # If a match is found, store the test result
        if match:
            test_results.append(
                {
                    "status": match.group("status"),
                    "name": match.group("name"),
                    "time": int(match.group("time") or 0),
                }
            )

    # Initialize the JUnit XML document
    xml = [f'<?xml version="1.0" encoding="UTF-8"?>']

    test_cases = []

    errors = 0
    failures = 0
    skipped = 0

    # Iterate over each test result

    for result in test_results:
        # Add a testcase element to the XML document
        escaped_name = escape(result["name"])
        escaped_name = escaped_name.replace('"', "'")

        test_cases.append(
            f'\t\t<testcase name="{escaped_name}" time="{result["time"]}">'
        )

        good_cases = ["ignore", "ok", "ready", "done"]
        if not any(x in result["status"] for x in good_cases):
            if "err" in result["status"]:
                errors = errors + 1
                test_cases.append("\t\t\t<error />")
            elif "fail" in result["status"]:
                failures = failures + 1
                test_cases.append("\t\t\t<failure />")
            else:
                test_cases.append(f'\t\t\t<unknown status="{result["status"]}/>')
        elif "ignore" in result["status"]:
            skipped = skipped + 1

        # Close the testcase element
        test_cases.append("\t\t</testcase>")
    xml.append(
        f'\t<testsuites name="Redis Tests" tests="{len(test_results)}" errors="{errors}" failures="{failures}" skipped="{skipped}">'
    )
    xml.append(
        f'\t<testsuite name="Redis Test Suite 1" tests="{len(test_results)}" errors="{errors}" failures="{failures}" skipped="{skipped}">'
    )
    xml = xml + test_cases
    # Close the testsuite and testsuites elements
    xml.append("\t</testsuite>")
    xml.append("</testsuites>")

    # Return the JUnit XML document as a string
    return "\n".join(xml)


def write_junit_xml_to_file(xml, destination_file):
    # Open a file for writing
    with open(destination_file, "w") as f:
        # Write the XML to the file
        f.write(xml)


def read_raw_stdout_from_file(source_file):
    # Open a file for writing
    raw_data = ""
    with open(source_file, "r") as f:
        # Write the XML to the file
        raw_data = f.read()
    return raw_data


# Generate the JUnit XML test results
script_file, source_file, destination_file = argv

text = read_raw_stdout_from_file(source_file)
xml = generate_junit_xml(text)
write_junit_xml_to_file(xml, destination_file)
