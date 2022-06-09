parseint() = parse(Int, readline())

function solve(n)
    stds = [["a" => 0]]
    for i in 2:n
        ss = Pair{String,Int}[]
        for (s, ind) in stds[i-1]
            for j in 0:ind
                push!(ss, s * ('a' + j) => ind)
            end
            push!(ss, s * ('a' + ind + 1) => ind + 1)
        end
        push!(stds, ss)
    end
    first.(last(stds))
end

function main()
    n = parseint()
    for x in solve(n)
        println(x)
    end
end

main()
