parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

const P = 10^9 + 7

function solve(n, as)
    res = 0
    for k in 0:60-1
        z = 1 << k
        b = 0
        c = 0
        for a in as
            if a & z == 0
                b += 1
            else
                c += 1
            end
        end
        res += (((b * c) % P) * (z % P)) % P
        res %= P
    end
    res
end

function main()
    n = parseint()
    as = parseints()
    solve(n, as) |> println
end

main()
