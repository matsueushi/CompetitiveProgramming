function solve(a, b, c)
    for i in 1:1000
        a ≤ c * i ≤ b && return c * i
    end
    -1
end

function main()
    a, b, c = parse.(Int, split(readline()))
    println(solve(a, b, c))
end

main()
