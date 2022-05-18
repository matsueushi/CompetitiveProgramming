function solve(s)
    str = "keyence"
    for i in 1:length(str)-1
        (startswith(s, str[1:i]) && endswith(s, str[i+1:end])) && return true
    end
    false
end

function main()
    s = readline()
    println(solve(s) ? "YES" : "NO")
end

main()
