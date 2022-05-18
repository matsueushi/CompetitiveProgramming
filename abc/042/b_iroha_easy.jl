function main()
    n, l = parse.(Int, split(readline()))
    ss = Vector{String}(undef, n)
    for i in 1:n
        ss[i] = readline()
    end
    sort!(ss)
    println(join(ss))
end

main()
