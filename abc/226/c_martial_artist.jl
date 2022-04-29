function solve(n, ts, a)
    stack = [n]
    used = falses(n)
    t = 0
    while !isempty(stack)
        x = pop!(stack)
        used[x] && continue
        used[x] = true
        t += ts[x]
        for y in a[x]
            push!(stack, y)
        end
    end
    t
end

function main()
    n = parse(Int, readline())
    ts = zeros(Int, n)
    a = Vector{Int}[]
    for i in 1:n
        input = parse.(Int, split(readline()))
        ts[i] = input[1]
        push!(a, input[3:end])
    end
    println(solve(n, ts, a))
end

main()
