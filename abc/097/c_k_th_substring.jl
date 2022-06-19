parseint() = parse(Int, readline())

function solve(s, k)
    subs = String[]
    for i in 1:5
        for j in 1:length(s)-(i-1)
            push!(subs, s[j:j+i-1])
        end
    end
    unique!(subs)
    sort!(subs)
    subs[k]
end

function main()
    s = readline()
    k = parseint()
    solve(s, k) |> println
end

main()
