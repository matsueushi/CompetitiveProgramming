function solve(s)
    s == lowercase(s) && return false
    s == uppercase(s) && return false
    length(Set(s)) == length(s)
end

function main()
    s = readline()
    println(solve(s) ? "Yes" : "No")
end

main()
