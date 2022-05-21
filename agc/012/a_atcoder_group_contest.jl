parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function main()
    n = parseint()
    as = parseints()
    sort!(as, rev=true)
    res = 0
    for i in 1:n
        res += as[2*i]
    end
    println(res)
end

main()
