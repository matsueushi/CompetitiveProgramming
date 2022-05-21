parseint() = parse(Int, readline())

function solve(n, s)
    set1 = Set{Char}()
    set2 = Set{String}()
    set3 = Set{String}()
    for i in 1:n
        for t in set2
            push!(set3, t * s[i])
        end
        for c in set1
            push!(set2, c * s[i])
        end
        push!(set1, s[i])
    end
    length(set3)
end

function main()
    n = parseint()
    s = readline()
    println(solve(n, s))
end

main()
