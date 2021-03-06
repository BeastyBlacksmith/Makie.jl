cd(@__DIR__)
samples = readstring("all_samples.jl")

_, setup_rest = split(samples, "#setup")
setup_rest = split(setup_rest, "#cell")
setup = first(setup_rest)
cells = setup_rest[2:end]

open("visual_regression_funcs.jl", "w") do io
    println(io, setup)
    for (i, body) in enumerate(cells)
        body = chomp(body)
        println(io, "function testfunc_$i()")
        for line in split(body, "\n")
            println(io, " "^4, line)
        end
        println(io, "end")
    end
end

open("sample_funcs.jl", "w") do io
    println(io, setup)
    for (i, body) in enumerate(cells)
        body = chomp(body)
        println(io, "function testfunc_$i()")
        for line in split(body, "\n")
            println(io, " "^4, line)
        end
        println(io, "end")
    end
end
