class BaseService
    private_class_method :new

    def.self(*args)
        new(*args).call
    end
end