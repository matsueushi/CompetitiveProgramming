function solve(n, as, bs)
    logs = NTuple{2,Int}[]
    for i in 1:n
        push!(logs, (as[i], 1))
        push!(logs, (as[i] + bs[i], -1))
    end
    sort!(logs, by=x -> (x[1], -x[2]))
    count = 0
    ret = zeros(Int, n)
    for i in 1:2*n-1
        s, c = logs[i]
        s2, _ = logs[i+1]
        count += c
        count == 0 && continue
        ret[count] += s2 - s
    end
    ret
end

function main()
    n = parse(Int, readline())
    as, bs = zeros(Int, n), zeros(Int, n)
    for i in 1:n
        as[i], bs[i] = parse.(Int, split(readline()))
    end
    println(join(solve(n, as, bs), " "))
end

main()
