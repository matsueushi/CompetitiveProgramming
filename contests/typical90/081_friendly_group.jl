const MAX_SIZE = 5000

function solve(n, k, xs, ys)
    plane = zeros(Int64, MAX_SIZE, MAX_SIZE)
    for i in 1:n
        z = max(1, xs[i] - k)
        w = max(1, ys[i] - k)
        plane[z, w] += 1
        xs[i] + 1 ≤ MAX_SIZE && (plane[xs[i]+1, w] -= 1)
        ys[i] + 1 ≤ MAX_SIZE && (plane[z, ys[i]+1] -= 1)
        (xs[i] + 1 ≤ MAX_SIZE && ys[i] + 1 ≤ MAX_SIZE) && (plane[xs[i]+1, ys[i]+1] += 1)
    end
    plane = cumsum(plane; dims = 1)
    plane = cumsum(plane; dims = 2)
    maximum(plane)
end

function main()
    n, k = parse.(Int64, split(readline()))
    xs = zeros(Int64, n)
    ys = zeros(Int64, n)
    for i in 1:n
        xs[i], ys[i] = parse.(Int64, split(readline()))
    end
    println(solve(n, k, xs, ys))
end

main()
