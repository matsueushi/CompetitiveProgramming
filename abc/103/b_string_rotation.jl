function solve(s, t)
    for i in 1:length(s)
        s == t[i:end] * t[1:i-1] && return true
    end
    false
end

function main()
    s = readline()
    t = readline()
    println(solve(s, t) ? "Yes" : "No")
end

main()
