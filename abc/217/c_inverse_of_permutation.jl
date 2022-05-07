function main()
    n = parse(Int, readline())
    ps = parse.(Int, split(readline()))
    vs = zeros(Int, n)
    for i in 1:n
        vs[ps[i]] = i
    end
    println(join(vs, " "))
end

main()
