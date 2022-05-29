parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function solve(n, as)
    res = 3^n
    exc = 1
    for i in 1:n
        exc *= ifelse(isodd(as[i]), 1, 2)
    end
    res - exc
end

function main()
    n = parseint()
    as = parseints()
    println(solve(n, as))
end

main()
