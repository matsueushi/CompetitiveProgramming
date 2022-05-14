function main()
    h, w = parse.(Int, split(readline()))
    cs = Vector{String}(undef, h)
    for i in 1:h
        cs[i] = readline()
    end

    for i in 1:h
        println(cs[i])
        println(cs[i])
    end
end

main()
