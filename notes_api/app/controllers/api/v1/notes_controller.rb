module Api
  module V1
    class NotesController < ApplicationController
      before_action :check_user_status, only: %i(first_sync)
      def index
        @notes = Note.order(created_at: :desc)
        render json: @notes, status: :ok
      end

      def create
        @note = Note.new(note_params)
        if @note.save
          render json: @note, status: :created
        else
          render json: {errors: @note.errors}, status: :unprocessable_entity
        end
      end

      def destroy
        @note = Note.find_by(id: params[:id])
        if @note&.destroy
          render json: {message: 'Anotação removida com sucesso!'}, status: :no_content
        else
          render json: {message: "Anotação com o id #{params[:id]} não encontrado"}, status: :not_found
        end
      end

      def first_sync
        if Note.save_all(notes_params)
          @user.active!
          render json: {message: 'Anotações sincronizadas com sucesso!'}, status: :created
        else
          render json: {message: 'Não foi possível sincronizar as anotações!'}, status: :unprocessable_entity
        end
      end
      private
      def note_params
        params.require(:note).permit(:title, :content)
      end

      def notes_params
        params.require(:notes).map do |note_params|
          note_params.permit(:title, :content)
        end
      end

      def check_user_status
        if !@user.created?
          render json: {message: 'Não sincronizado! Usuario não é novo.'}, status: :no_content
          return
        end
      end
    end
  end
end
