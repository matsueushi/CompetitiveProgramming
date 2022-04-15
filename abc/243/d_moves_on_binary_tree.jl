function solve(n, x, s)
    a = Char[]
    for i in 1:n
        if !isempty(a) && s[i] == 'U' && (a[end] == 'L' || a[end] == 'R')
            pop!(a)
        else
            push!(a, s[i])
        end
    end
    for f in a
        if f == 'U'
            x >>= 1
        elseif f == 'L'
            x = 2 * x
        else
            x = 2 * x + 1
        end
    end
    x
end

function main()
    n, x = parse.(Int64, split(readline()))
    s = readline()
    println(solve(n, x, s))
end

main()
