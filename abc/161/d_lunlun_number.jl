parseint() = parse(Int, readline())

function solve(k)
    n = 10
    lunluns = [Int[] for i in 1:n]
    for i in 1:9
        push!(lunluns[1], i)
    end
    for k in 1:n-1
        for x in lunluns[k]
            d = x % 10
            for j in [-1, 0, 1]
                if 0 ≤ d + j ≤ 9
                    push!(lunluns[k+1], x * 10 + d + j)
                end
            end
        end
    end
    ls = vcat(lunluns...)
    ls[k]
end

function main()
    k = parseint()
    println(solve(k))
end

main()
