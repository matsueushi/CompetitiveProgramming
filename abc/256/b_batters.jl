parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function solve(n, as)
    p = 0
    pos = zeros(Int, 4)
    for i in 1:n
        pos[1] += 1
        for j in 4:-1:1
            if j + as[i] > 4
                p += pos[j]
            else
                pos[j+as[i]] += pos[j]
            end
            pos[j] = 0
        end
    end
    p
end

function main()
    n = parseint()
    as = parseints()
    solve(n, as) |> println
end

main()
