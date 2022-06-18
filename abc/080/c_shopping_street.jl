parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function solve(n, fs, ps)
    p = -typemax(Int)
    for i in 1:1<<10-1
        cs = zeros(Int, n)
        for j in 1:10
            if i >> (j - 1) & 1 == 1
                for k in 1:n
                    fs[k, j] == 1 && (cs[k] += 1)
                end
            end
        end
        p0 = 0
        for k in 1:n
            p0 += ps[k, cs[k]+1]
        end
        p = max(p, p0)
    end
    p
end

function main()
    n = parseint()
    fs = zeros(Int, n, 10)
    for i in 1:n
        fs[i, :] = parseints()
    end
    ps = zeros(Int, n, 11)
    for i in 1:n
        ps[i, :] = parseints()
    end
    solve(n, fs, ps) |> println
end

main()
