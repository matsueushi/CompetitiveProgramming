parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

const P = 1000000007

function solve(n, as)
    res = 1
    ns = zeros(Int, 3)
    for i in 1:n
        m = 0
        for j in 1:3
            if as[i] == ns[j]
                m == 0 && (ns[j] += 1)
                m += 1
            end
        end
        res = (res * m) % P
    end
    res
end

function main()
    n = parseint()
    as = parseints()
    solve(n, as) |> println
end

main()
