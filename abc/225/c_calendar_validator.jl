function solve(n, m, b)
    for j in 1:m-1
        mod1(b[1, j], 7) < mod1(b[1, j+1], 7) || return false
    end
    for i in 1:n
        for j in 1:m-1
            b[i, j+1] - b[i, j] == 1 || return false
        end
    end
    for i in 1:n-1
        for j in 1:m
            b[i+1, j] - b[i, j] == 7 || return false
        end
    end
    true
end

function main()
    n, m = parse.(Int, split(readline()))
    b = zeros(Int, n, m)
    for i in 1:n
        b[i, :] = parse.(Int, split(readline()))
    end
    println(solve(n, m, b) ? "Yes" : "No")
end

main()
