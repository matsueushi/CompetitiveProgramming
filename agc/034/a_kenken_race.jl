parseints() = parse.(Int, split(readline()))

function reachable(s, f, t)
    for i in f:t-1
        s[i] == s[i+1] == '#' && return false
    end
    true
end

function solve(n, a, b, c, d, s)
    if c > d
        p = 0
        for i in b:n-2
            s[i-1] == s[i] == s[i+1] == '.' && (p = i; break)
        end
        (p == 0 || p > d || p + 1 > c || !reachable(s, a, p + 1) || !reachable(s, b, p)) && return false
        a = p + 1
        b = p
    end
    reachable(s, a, c) && reachable(s, b, d)
end

function main()
    n, a, b, c, d = parseints()
    s = readline()
    println(ifelse(solve(n, a, b, c, d, s), "Yes", "No"))
end

main()
