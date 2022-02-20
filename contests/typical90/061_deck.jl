function solve(q, ts, xs)
    i, j = 0, 0
    hds = zeros(Int64, q)
    tls = zeros(Int64, q)
    for (t, x) in zip(ts, xs)
        if t == 1
            i += 1
            hds[i] = x
        elseif t == 2
            j += 1
            tls[j] = x
        else
            println(x ≤ i ? hds[i-x+1] : tls[x-i])
        end
    end
end


function main()
    q = parse(Int64, readline())
    ts = zeros(Int64, q)
    xs = zeros(Int64, q)
    for i in 1:q
        ts[i], xs[i] = parse.(Int64, split(readline()))
    end
    solve(q, ts, xs)
end

main()
