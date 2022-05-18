function solve(n, m, as, bs)
    for i in 1:n-m+1
        for j in 1:n-m+1
            matched = true
            for k in 1:m
                matched &= bs[k] == as[k+j-1][i:i+m-1]
            end
            matched && return true
        end
    end
    false
end

function main()
    n, m = parse.(Int, split(readline()))
    as = Vector{String}(undef, n)
    bs = Vector{String}(undef, m)
    for i in 1:n
        as[i] = readline()
    end
    for i in 1:m
        bs[i] = readline()
    end
    println(ifelse(solve(n, m, as, bs), "Yes", "No"))
end

main()
