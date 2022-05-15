function solve(s, t)
    s2 = replace(s, "?" => "a")
    found = false
    slen, tlen = length(s), length(t)
    tend = slen - tlen + 1
    res = "z"^50
    for i in 1:tend
        ok = true
        for j in 1:tlen
            s[i+j-1] == '?' && continue
            ok &= s[i+j-1] == t[j]
        end
        if ok
            found = true
            res = min(res, s2[1:i-1] * t * s2[i+tlen:end])
        end
    end
    ifelse(found, res, "UNRESTORABLE")
end

function main()
    s = readline()
    t = readline()
    println(solve(s, t))
end

main()
