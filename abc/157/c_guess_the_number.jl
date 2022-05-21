parseints() = parse.(Int, split(readline()))

function solve(n, m, ss, cs)
    digits = fill(-1, n)
    for i in 1:m
        s = ss[i]
        if digits[s] > 0 && digits[s] != cs[i]
            return -1
        end
        digits[s] = cs[i]
    end
    res = 0
    for i in 1:n
        res += max(0, digits[i]) * 10^(n - i)
    end
    if n > 1 && res < 10^(n - 1)
        if digits[1] != 0
            res += 10^(n - 1)
        else
            return -1
        end
    end
    res
end

function main()
    n, m = parseints()
    ss, cs = zeros(Int, m), zeros(Int, m)
    for i in 1:m
        ss[i], cs[i] = parseints()
    end
    println(solve(n, m, ss, cs))
end

main()
