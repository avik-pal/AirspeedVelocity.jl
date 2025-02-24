using AirspeedVelocity
using OrderedCollections: OrderedDict
using Pkg
using Documenter
using Documenter: Remotes

# First, we copy README.md to index.md,
# replacing <README> in _index.md with the contents of README.md:
open("docs/src/index.md", "w") do io
    for line in eachline("docs/src/_index.md")
        if occursin(r"<README>", line)
            for rline in eachline("README.md")
                println(io, rline)
            end
        else
            println(io, line)
        end
    end
end

DocMeta.setdocmeta!(
    AirspeedVelocity,
    :DocTestSetup,
    :(using AirspeedVelocity);
    recursive = true,
)

makedocs(;
    modules = [AirspeedVelocity],
    authors = "Miles Cranmer <miles.cranmer@gmail.com>",
    repo = Remotes.GitHub("MilesCranmer", "AirspeedVelocity.jl"),
    sitename = "AirspeedVelocity.jl",
    format = Documenter.HTML(;
        prettyurls = get(ENV, "CI", "false") == "true",
        canonical = "https://MilesCranmer.github.io/AirspeedVelocity.jl",
        edit_link = "master",
        assets = String[],
    ),
    pages = ["Home" => "index.md", "API" => "api.md"],
    warnonly = true,
)

deploydocs(; repo = "github.com/MilesCranmer/AirspeedVelocity.jl", devbranch = "master")
