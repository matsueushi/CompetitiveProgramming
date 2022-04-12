function signup(n, ss)
    users = Set{String}()
    acdates = Int64[]
    for i in 1:n
        if ss[i] ∉ users
            push!(users, ss[i])
            push!(acdates, i)
        end
    end
    acdates
end

function main()
    n = parse(Int64, readline())
    ss = Vector{String}(undef, n)
    for i in 1:n
        ss[i] = readline()
    end
    println(join(signup(n, ss), "\n"))
end

main()
