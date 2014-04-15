module Worker
  class Mailer

    def process(payload)
      payload.symbolize_keys!

      mailer = payload[:mailer_class].constantize
      action = payload[:method]
      args   = payload[:args]

      message = mailer.send(:new, action, *args).message
      message.deliver
    end

  end
end