function main()
    n = parse(Int, readline())
    as = parse.(Int, split(readline()))
    ord = zeros(Int, n)
    for i in 1:n
        ord[as[i]] = i
    end
    println(join(ord, " "))
end

main()
