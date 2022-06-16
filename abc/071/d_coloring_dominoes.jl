parseint() = parse(Int, readline())

const P = 1000000007

function solve(n, s1, s2)
    ts = Bool[]
    for i in 1:n
        (i != n && s1[i] == s1[i+1]) && continue
        if s1[i] == s2[i]
            push!(ts, true)
        else
            push!(ts, false)
        end
    end

    res = ifelse(ts[1], 3, 6)
    for i in 2:length(ts)
        if ts[i] == ts[i-1] == false
            res = (3 * res) % P
        elseif (ts[i] == ts[i-1] == true) || (!ts[i] && ts[i-1])
            res = (2 * res) % P
        end
    end
    res
end

function main()
    n = parseint()
    s1 = readline()
    s2 = readline()
    solve(n, s1, s2) |> println
end

main()
