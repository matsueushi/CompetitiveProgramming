parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function solve(n, as)
    s = sum(as) ÷ 2
    res = zeros(Int, n)
    m = n ÷ 2
    x = sum(@view as[2:2:end])
    for i in 1:m
        res[2*i-1] = s - x
        x += as[2*i-1] - as[2*i]
    end
    res[2*m+1] = s - x
    x = sum(@view as[3:2:end])
    for i in 1:m
        res[2*i] = s - x
        x += as[2*i] - as[2*i+1]
    end
    2 .* res
end

function main()
    n = parseint()
    as = parseints()
    println(join(solve(n, as), " "))
end

main()
