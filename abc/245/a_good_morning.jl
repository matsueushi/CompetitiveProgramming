function solve(a, b, c, d)
    if a < c
        return true
    elseif a == c
        return b ≤ d
    else
        return false
    end
end

function main()
    a, b, c, d = parse.(Int64, split(readline()))
    println(solve(a, b, c, d) ? "Takahashi" : "Aoki")
end

main()
