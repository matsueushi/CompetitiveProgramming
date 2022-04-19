function solve(s)
    n = length(s)
    a = b = 0
    for i in 1:n
        s[i] == 'a' || break
        a += 1
    end
    for j in n:-1:1
        s[j] == 'a' || break
        b += 1
    end
    a - b > 0 && return false
    s[a+1:n-b] == s[n-b:-1:a+1]
end

function main()
    s = readline()
    println(solve(s) ? "Yes" : "No")
end

main()
