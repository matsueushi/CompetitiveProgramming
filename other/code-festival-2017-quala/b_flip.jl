parseints() = parse.(Int, split(readline()))

function solve(n, m, k)
    for i in 0:n
        for j in 0:m
            k == i * j + (n - i) * (m - j) && return true
        end
    end
    false
end

function main()
    n, m, k = parseints()
    println(ifelse(solve(n, m, k), "Yes", "No"))
end

main()
