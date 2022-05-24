parseint() = parse(Int, readline())

function solve(n, ss)
    res = 0
    x = 0 # XA
    y = 0 # BX
    z = 0 # BA
    for i in 1:n
        s = first(ss[i])
        t = last(ss[i])
        if s == 'B' && t == 'A'
            z += 1
        elseif s == 'B'
            y += 1
        elseif t == 'A'
            x += 1
        end

        for j in 1:length(ss[i])-1
            ss[i][j:j+1] == "AB" && (res += 1)
        end
    end
    if x == 0 && y == 0
        res += max(0, z - 1)
    elseif x == 0 || y == 0
        res += z
    else
        res += min(x, y) + z
    end
    res
end

function main()
    n = parseint()
    ss = Vector{String}(undef, n)
    for i in 1:n
        ss[i] = readline()
    end
    println(solve(n, ss))
end

main()
