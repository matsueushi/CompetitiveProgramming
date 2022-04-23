using DataStructures

const M = 10^6

function solve(a, n)
    deq = Deque{Int}()
    push!(deq, n)
    xs = fill(typemax(Int), M)
    xs[n] = 0
    while !isempty(deq)
        x = popfirst!(deq)

        x == 1 && return xs[1]
        if x % a == 0
            push!(deq, x ÷ a)
            xs[x÷a] = xs[x] + 1
        end

        t = 0
        while x ≥ 10^t
            t += 1
        end
        t -= 1
        r = (x ÷ 10^t) + 10 * (x % 10^t)
        if r ≥ 10^t && xs[r] == typemax(Int)
            push!(deq, r)
            xs[r] = xs[x] + 1
        end
    end
    -1
end

function main()
    a, n = parse.(Int, split(readline()))
    println(solve(a, n))
end

main()
