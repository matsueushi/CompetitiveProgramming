function solve(s, t)
    n = length(s)
    i = 0
    count = 0
    while i < n
        i += 1
        s[i] == t[i] && continue
        (count > 0 || i == n || s[i] != t[i+1] || s[i+1] != t[i]) && return false
        count += 1
        i += 1
    end
    true
end

function main()
    s = readline()
    t = readline()
    println(solve(s, t) ? "Yes" : "No")
end

main()
