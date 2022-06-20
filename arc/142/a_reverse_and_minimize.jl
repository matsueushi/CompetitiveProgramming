parseints() = parse.(Int, split(readline()))

function reversed_number(n::Int)
    rev = 0
    while n > 0
        rev *= 10
        n, r = divrem(n, 10)
        rev += r
    end
    rev
end

function solve(n, k)
    x = reversed_number(k)
    x < k && return 0
    y = k
    res = 0
    while y ≤ n
        res += 1
        y *= 10
    end
    if x != k
        z = x
        while z ≤ n
            res += 1
            z *= 10
        end
    end
    res
end

function main()
    n, k = parseints()
    solve(n, k) |> println
end

main()
