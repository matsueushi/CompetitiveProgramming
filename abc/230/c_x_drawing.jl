function solve(n, a, b, p, q, r, s)
    for i in 1:q-p+1
        for j in 1:s-r+1
            x = p + i - 1
            y = r + j - 1
            if y - x == b - a || y + x == b + a
                print('#')
            else
                print('.')
            end
        end
        println()
    end
end

function main()
    n, a, b = parse.(Int, split(readline()))
    p, q, r, s = parse.(Int, split(readline()))
    solve(n, a, b, p, q, r, s)
end

main()
