parseint() = parse(Int, readline())

function isgood(n)
    s = Set{Int}()
    while n > 0
        push!(s, n % 10)
        n ÷= 10
    end
    length(s) == 3
end

function solve(n)
    ns = Vector{Int}[[3, 5, 7]]
    for i in 1:8
        xs = []
        for y in last(ns)
            for j in [3, 5, 7]
                push!(xs, 10 * y + j)
            end
        end
        push!(ns, xs)
    end
    goodns = filter(isgood, vcat(ns...))
    length(filter(≤(n), goodns))
end

function main()
    n = parseint()
    println(solve(n))
end

main()
