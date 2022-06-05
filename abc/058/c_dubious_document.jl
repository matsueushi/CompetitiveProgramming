parseint() = parse(Int, readline())

function chars(s)
    cs = zeros(Int, 26)
    for c in s
        cs[c-'a'+1] += 1
    end
    cs
end

function solve(n, ss)
    cs = chars(ss[1])
    for i in 2:n
        cs2 = chars(ss[i])
        cs = min.(cs, cs2)
    end
    s = ""
    for i in 1:26
        s = s * ('a' + i - 1)^cs[i]
    end
    s
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
