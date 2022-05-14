function solve(n, ws)
    used = Set{String}()
    for i in 1:n
        ws[i] ∈ used && return false
        push!(used, ws[i])
        (i > 1 && last(ws[i-1]) != first(ws[i])) && return false
    end
    true
end

function main()
    n = parse(Int, readline())
    ws = String[]
    for i in 1:n
        push!(ws, readline())
    end
    println(solve(n, ws) ? "Yes" : "No")
end

main()
