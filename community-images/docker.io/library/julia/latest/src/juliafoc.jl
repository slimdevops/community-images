using Pkg
Pkg.add("HTTP")
using HTTP

function main()
    HTTP.serve("0.0.0.0",8080) do request::HTTP.Request
        return HTTP.Response("Hello World")
      end
end

main()
