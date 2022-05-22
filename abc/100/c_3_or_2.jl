parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function solve(n, as)
    res = 0
    for i in 1:n
        a = as[i]
        while iseven(a)
            a >>= 1
            res += 1
        end
    end
    res
end

function main()
    n = parseint()
    as = parseints()
    println(solve(n, as))
end

main()
