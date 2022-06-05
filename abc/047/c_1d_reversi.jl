function solve(s)
    res = 0
    c = s[1]
    for i in 1:length(s)-1
        c != s[i+1] && (res += 1)
        c = s[i+1]
    end
    res
end

function main()
    s = readline()
    println(solve(s))
end

main()
