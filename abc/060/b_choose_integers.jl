function solve(a, b, c)
    for i in 1:b
        a * i % b == c && return true
    end
    false
end

function main()
    a, b, c = parse.(Int, split(readline()))
    println(solve(a, b, c) ? "YES" : "NO")
end

main()
