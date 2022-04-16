const N = 6

function solve(n, ss)
    for i in 1:n
        for j in 1:n+1-N
            count = 0
            for k in 0:N-1
                ss[i][j+k] == '#' && (count += 1)
            end
            count ≥ N - 2 && return true
        end
    end
    for i in 1:n+1-N
        for j in 1:n
            count = 0
            for k in 0:N-1
                ss[i+k][j] == '#' && (count += 1)
            end
            count ≥ N - 2 && return true
        end
    end
    for i in 1:n+1-N
        for j in 1:n+1-N
            count = 0
            for k in 0:N-1
                ss[i+k][j+k] == '#' && (count += 1)
            end
            count ≥ N - 2 && return true
        end
    end
    for i in 1:n+1-N
        for j in N:n
            count = 0
            for k in 0:N-1
                ss[i+k][j-k] == '#' && (count += 1)
            end
            count ≥ N - 2 && return true
        end
    end
    return false
end

function main()
    n = parse(Int, readline())
    ss = String[]
    for i in 1:n
        push!(ss, readline())
    end
    println(solve(n, ss) ? "Yes" : "No")
end

main()
