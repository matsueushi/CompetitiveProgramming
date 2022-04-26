function solve(a, b)
    while a > 0 && b > 0
        a, u = divrem(a, 10)
        b, v = divrem(b, 10)
        u + v ≥ 10 && return true
    end
    false
end

function main()
    a, b = parse.(Int, split(readline()))
    println(solve(a, b) ? "Hard" : "Easy")
end

main()
