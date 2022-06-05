parseint() = parse(Int, readline())

function solve(s, k)
    length(unique(s)) == 1 && return (length(s) * k) >> 1
    res = 0
    if first(s) == last(s)
        f = 1
        for i in 1:length(s)-1
            s[i] == s[i+1] || break
            f += 1
        end
        t = 1
        for i in length(s):-1:2
            s[i] == s[i-1] || break
            t += 1
        end
        res += f >> 1 + ((f + t) >> 1) * (k - 1) + t >> 1
        s = s[f+1:end-t]
    end

    ss = Vector{Char}(s)
    res0 = 0
    for i in 1:length(s)-1
        ss[i] == ss[i+1] && (ss[i+1] = 'X'; res0 += 1)
    end
    res + res0 * k
end

function main()
    s = readline()
    k = parseint()
    println(solve(s, k))
end

main()
